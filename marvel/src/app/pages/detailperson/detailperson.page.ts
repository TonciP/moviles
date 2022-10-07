import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import json from '../../../assets/application.json';
@Component({
  selector: 'app-detailperson',
  templateUrl: './detailperson.page.html',
  styleUrls: ['./detailperson.page.scss'],
})
export class DetailpersonPage implements OnInit {
  nombre: string;
  pahtfondo: string;
  comic = {
    json
  };
  heroes: any;
  villains: any;
  antihero: any;
  aliens: any;
  humans: any;

  constructor(private route: ActivatedRoute) {
    this.nombre = this.route.snapshot.paramMap.get('nombre');

    this.heroes = this.comic.json.heroes.find(item => item.name === this.nombre);
    this.villains = this.comic.json.villains.find(item => item.name === this.nombre);
    this.antihero = this.comic.json.antiHeroes.find(item => item.name === this.nombre);
    this.aliens = this.comic.json.aliens.find(item => item.name === this.nombre);
    this.humans = this.comic.json.humans.find(item => item.name === this.nombre);

    if(this.heroes !== undefined){
      this.pahtfondo = this.heroes.imagePath;
    }
    if(this.villains !== undefined){
      this.pahtfondo = this.villains.imagePath;
    }
    if(this.antihero !== undefined){
      this.pahtfondo = this.antihero.imagePath;
    }
    if(this.aliens !== undefined){
      this.pahtfondo = this.aliens.imagePath;
    }
    if(this.humans !== undefined){
      this.pahtfondo = this.humans.imagePath;
    }
  }

  ngOnInit() {
  }

}
