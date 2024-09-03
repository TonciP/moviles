import { Component, Input } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { NotaBLL } from 'src/app/bll/NotaBLL';
import { DataService, Message } from '../../services/data.service';
import { NotaService } from '../../services/nota.service';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {
  @Input() public refreshLista: boolean;
  form = new FormGroup({
    texto: new FormControl('',
    [
    Validators.required,
    Validators.minLength(5)
    ]
    )
  });
  notaBll: NotaBLL = new NotaBLL();
  constructor(private data: DataService, private notaService: NotaService) {}

  refresh(ev) {
    setTimeout(() => {
      ev.detail.complete();
    }, 3000);
  }

  getMessages(): Message[] {
    return this.data.getMessages();
  }
  guardar(){
    //TODO hacer que inserte cosas
    this.notaBll.insert(
      this.notaService,
      this.form.controls.texto.value
    );
    this.refreshLista = true;
  }

}
