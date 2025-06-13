import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http'; // correct import

import { environment } from '../../environments/environment';
import { Observable } from 'rxjs';

export interface Book {
  id?: number;
  title: string;
  author: string;
  genre: string;
}

@Injectable({ providedIn: 'root' })
export class BookService {
  private apiUrl = `${environment.apiUrl}/Books`;

  constructor(private http: HttpClient) {}

  getBooks(): Observable<Book[]> {
    return this.http.get<Book[]>(this.apiUrl);
  }

  addBook(book: Book): Observable<Book> {
    return this.http.post<Book>(this.apiUrl, book);
  }

  updateBook(id: number, book: Book): Observable<any> {
    return this.http.put(`${this.apiUrl}/${id}`, book);
  }

  deleteBook(id: number): Observable<any> {
    return this.http.delete(`${this.apiUrl}/${id}`);
  }
}
