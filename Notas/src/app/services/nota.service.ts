import { Injectable } from '@angular/core';
import { SQLite, SQLiteObject } from '@awesome-cordova-plugins/sqlite/ngx';
import { Platform } from '@ionic/angular';

@Injectable({
  providedIn: 'root'
})
export class NotaService {
  public database: SQLiteObject;
  constructor(private sqlite: SQLite, private platform: Platform) {
    this.platform.ready().then(() => {
      this.createDb();
    });
   }
   async createDb() {
    await this.sqlite.create({
      name: 'agenda',
      location: 'default'
    }).then((db: SQLiteObject) => {
      this.database = db;
      this.createTables();
    }, (error) => {
      console.log('error al crear db', error);
    });
  }
  async createTables() {
    try {
      await this.database.executeSql(
        // eslint-disable-next-line max-len
        'CREATE TABLE IF NOT EXISTS nota(id INTEGER PRIMARY KEY AUTOINCREMENT, texto TEXT, color TEXT)'
        , []);
    } catch (e) {
      console.log('error al crear tablas', e);
    }
  }
}
