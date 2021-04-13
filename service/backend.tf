terraform {
   backend "remote" {
     hostname     = "app.terraform.io"
     organization = "tcb-okeaserviceapp"
 
     workspaces {
       name = "oke-apps"
     }
   }
 }





