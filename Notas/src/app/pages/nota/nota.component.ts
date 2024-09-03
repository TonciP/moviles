import { Component, OnInit } from '@angular/core';
import { ToastController } from '@ionic/angular';
import { NotaBLL } from 'src/app/bll/NotaBLL';
import { Nota } from 'src/app/models/Nota';
import { NotaService } from 'src/app/services/nota.service';
import { element } from 'protractor';

@Component({
  selector: 'app-nota',
  templateUrl: './nota.component.html',
  styleUrls: ['./nota.component.scss'],
})
export class NotaComponent implements OnInit {
  notaBll: NotaBLL = new NotaBLL();
  listaNotas: Nota[] = [];
  text: string;
  constructor(private notaService: NotaService, private toast: ToastController) {
    //this.notaBll.insert(notaService, 'Mi primera nota');
    this.cargarLista();
  }

  ngOnInit() {}
  isIos() {
    const win = window as any;
    return win && win.Ionic && win.Ionic.mode === 'ios';
  }
  refresh(ev) {
    setTimeout(() => {
      ev.detail.complete();
    }, 3000);

  }
  cargarLista() {
    this.notaBll.selectAll(this.notaService).then(res => {
      if (res.rows.length > 0) {
        this.listaNotas = [];
        for (let i = 0; i < res.rows.length; i++) {
          const row = res.rows.item(i);
          this.listaNotas.push(row);
        }
      }
    });
  }
  async editar(event, id: number){
    //const toastcontroller = await this.toast.create({
      //message: id + ' ' + event.target.value,
     // duration: 4000
    //});
    //toastcontroller.present();
    // this.text = id + ' ' + event.target.value;
    this.notaBll.update(this.notaService, event.target.value, id);
    this.cargarLista();
  }
  delete(id){
    this.notaBll.delete(this.notaService, id);
    this.cargarLista();
  }
  color(color, id){
    const el = document.getElementById(`${id}`);
    el.setAttribute('class', color.target.value);
  }
}
