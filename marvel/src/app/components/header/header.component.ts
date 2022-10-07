import { Component, HostBinding, Input, OnInit } from '@angular/core';
import json from '../../../assets/application.json';
@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss'],
})
export class HeaderComponent implements OnInit {
  @Input() title: string;
  searchBox: boolean;
  busqueda: string;
  comic = {
    json
  };
  listaNombres = [];
  aux = [];
  heroes: any;
  villains: any;
  antihero: any;
  aliens: any;
  humans: any;

  constructor() {
    this.heroes = json.heroes;
    this.villains = json.villains;
    this.antihero = json.antiHeroes;
    this.aliens = json.aliens;
    this.humans = json.humans;

    json.heroes.forEach(element => {
      this.listaNombres.push(element.name);
    });
    json.villains.forEach(element => {
      this.listaNombres.push(element.name);
    });
    json.antiHeroes.forEach(element => {
      this.listaNombres.push(element.name);
    });
    json.aliens.forEach(element => {
      this.listaNombres.push(element.name);
    });
    json.humans.forEach(element => {
      this.listaNombres.push(element.name);
    });

    this.aux = this.listaNombres;
  }

  ngOnInit() {
  }
  clickedSearch() {
    this.searchBox = true;
  }
  focus() {
    this.searchBox = false;
  }
  buscar() {
    /*console.log(this.busqueda);
    console.log(this.listaNombres.filter(item => item === this.busqueda));
    console.log();*/
    if (this.busqueda !== '') {
      this.listaNombres = this.listaNombres.filter(item => item.toLowerCase().indexOf(this.busqueda.toLowerCase()) > -1);
    }else{
      this.listaNombres = this.aux;
    }
  }
  stadoLista(){
    console.log("mouse");
    this.listaNombres = this.aux;
  }
}
