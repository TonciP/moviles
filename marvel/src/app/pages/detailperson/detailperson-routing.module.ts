import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { DetailpersonPage } from './detailperson.page';

const routes: Routes = [
  {
    path: '',
    component: DetailpersonPage
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class DetailpersonPageRoutingModule {}
