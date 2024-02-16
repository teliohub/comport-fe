import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
})
export class AppComponent implements OnInit {
  public constructor(private readonly _http: HttpClient) {}

  public ngOnInit(): void {
    console.warn('ngOnInit');
    this._http
      .post('https://localhost:8082/api/v1/user/register', {
        firstName: 'admin',
        lastName: 'admin',
        password: '12345678aA',
        email: 'admsahdsa3@abv.bg',
      })
      .subscribe(console.warn, console.warn);
  }
}
