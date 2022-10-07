import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';

import { DetailpersonPageRoutingModule } from './detailperson-routing.module';

import { DetailpersonPage } from './detailperson.page';

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    DetailpersonPageRoutingModule
  ],
  declarations: [DetailpersonPage]
})
export class DetailpersonPageModule {}
