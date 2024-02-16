# Comport

This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 16.2.7.

## Prerequisites

- [Node.js](https://nodejs.org/en/) (v18.13.0)
- [Angular CLI](https://angular.io/cli) (v17.1.0)
- [Any shell](https://git-scm.com/downloads) you can use the git's one
- [mkcert](https://github.com/FiloSottile/mkcert)

# CREATE SSL certificates

> **Important!**
> 
> Create the certificates only once! There is no need to create them every time!

```shell
mkcert -install
```

```shell
mkcert -cert-file ssl/local-cert.pem -key-file ssl/local-key.pem localhost
```

> The certificate is at "./ssl/local-cert.pem" and the key at ".ssl/local-key.pem" ✅

## Development server

Run `npm start` for a dev server. The application will be available on `https://localhost:4200/`.

## Production server

Run `npm run start:prod` for a prod server. The application will be available on `https://localhost:4200/`.

## Linting

Run `npm run lint` to lint the project. This will run [eslint](https://eslint.org/). It is configured to be run automatically before every commit.

Follow the prettier rules in `.prettierrc.js`.

## Committing

> DO NOT COMMIT WITH `git commit -m "message"`.
>
> Use `npm run commit` instead. This will run [commitizen](https://github.com/commitizen) and prompt you to fill out a commit message.

Before every commit, husky will run unit tests. If it fails, the commit will be aborted.

## Build

Run `npm run build` to build the project. In addition to the standard configuration, we've made some enhancements for the production environment. We apply Brotli compression to the built files for improved performance, and we use the [http-server](https://www.npmjs.com/package/http-server) to serve these files.

## Running unit tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

Tests will be executed by Firefox. If you want to use a different browser, you can change it in `karma.conf.js`.

## Running end-to-end tests

Run `ng e2e` to execute the end-to-end tests via a platform of your choice. To use this command, you need to first add a package that implements end-to-end testing capabilities.

## Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI Overview and Command Reference](https://angular.io/cli) page.
