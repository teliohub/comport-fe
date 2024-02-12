const brotli = require('brotli');
const fs = require('fs');
const path = require('path');

const directoryPath = path.join(__dirname, '..', 'dist', 'comport');

console.log('Starting brotli compression over the dist folder...');
console.log(`Compressing files in ${directoryPath}`);

const doBrotliCompression = (fileContents, filePath) => {
  console.log(`Compressing ${filePath}`);

  const compressed = brotli.compress(fileContents) ?? Buffer.alloc(0);
  const compressedFilePath = filePath + '.br';

  return Promise.all([
    fs.promises.writeFile(compressedFilePath, compressed),
    fs.promises.unlink(filePath),
  ]);
};

const openFile = async (fileName) => {
  const filePath = `${fileName}`;

  console.log(`Reading ${filePath}`);

  return await fs.promises
    .readFile(filePath)
    .then((fileContents) => doBrotliCompression(fileContents, filePath))
    .then(() => console.log(`Compressed ${filePath}`))
    .catch((err) => console.warn(`Error compressing ${filePath}: ${err}`));
};

async function openDirectory(directoryPath) {
  const files = await fs.promises.readdir(directoryPath, {
    withFileTypes: true,
  });

  for (const file of files) {
    const filePath = path.join(directoryPath, file.name);

    if (Boolean(path.extname(filePath).length)) {
      await openFile(filePath);
    } else {
      await openDirectory(filePath);
    }
  }
}

openDirectory(directoryPath)
  .then(() => {
    console.log('All files compressed successfully'.toUpperCase());
  })
  .catch(console.error);
