import { Component } from '@angular/core';
import { BackendService } from './services/backend.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'skillcloud';

  products: any = [];

  constructor(private backend: BackendService) {
    this.backend.products.subscribe(data => {
      this.products = data;
    });
  }
}
