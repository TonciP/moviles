import { Component } from '@angular/core';
import json from '../../../assets/application.json';
import { PostService } from '../../services/post.service';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {
  heroes = {
    json
  };

  constructor(private api: PostService) {
    //this.cargarListaPosts();
    console.log(this.heroes);
    //const array = this.heroes.json.heroes.find(item => item.name === 'Homem Aranha');
    //console.log(array);
  }
  cargarListaPosts() {
    this.api.getListaPost().subscribe((data) => {
      console.log(data);
    });
  }
}
