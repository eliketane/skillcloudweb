import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class BackendService {

  baseUrl: String = 'http://localhost:8080/';

  productsRaw: any = [];
  productsSubject = new BehaviorSubject<any>([]);
  products = this.productsSubject.asObservable();

  constructor(private http: HttpClient) {
    this.getAllProducts();
  }

  // getting all lead actresses
  getAllProducts() {
    this.http.get(this.baseUrl + 'product', { observe: 'response' })
             .subscribe(data => {
                this.productsRaw = [];

                let temp: any = data.body;

                for (let item of temp) {
                  this.productsRaw.push(item);
                }

                // this updates the BehaviorSubject with the new array
                this.productsSubject.next(this.productsRaw);

             });
  }
}
