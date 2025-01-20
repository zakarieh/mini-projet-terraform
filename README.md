# Terraform mini-project 

Ce projet utilise Terraform pour déployer une infrastructure dans un sous-réseau dans AWS.

## Prérequis

Avant de commencer, assurez-vous d'avoir installé :

- [Terraform](https://www.terraform.io/downloads.html)
- Un compte AWS et les clés d'accès configurées via [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html).
- Creer un ficher dans un dossier `.secret` pour stocker ces secrets (par exemple : `../../.secrets/devops-zakarieh.pem` dans le fichier `locals.tf` et d'autre fichier que vous aller trouver dans le code)

## Étapes pour démarrer

1. **Clonez le projet** :
   
   Clonez le dépôt sur votre machine locale si nécessaire.

   ```bash
   git clone <URL_DU_DEPOT>
   cd mon-terraform-app
   ```

2. **Initialisez Terraform** :
   
   Exécutez la commande suivante pour initialiser le projet, télécharger les plugins nécessaires et configurer les modules.

   ```bash
   terraform init
   ```

3. **Vérifiez la configuration** :
   
   Vérifiez ce qui va être créé par Terraform (optionnel mais recommandé).

   ```bash
   terraform plan
   ```

4. **Appliquez la configuration** :
   
   Appliquez le plan pour créer l'infrastructure sur AWS.

   ```bash
   terraform apply
   ```

   Confirmez l'application lorsque demandé.

5. **Consultez les sorties** :
   
   Après l'application, vous pouvez afficher les informations sur l'infrastructure créée.

   ```bash
   terraform output
   ```

6. **Détruisez l'infrastructure** (optionnel) :
   
   Si vous voulez supprimer l'infrastructure créée, exécutez la commande suivante :

   ```bash
   terraform destroy
   ```

 
---

Ce `README.md` décrit un projet Terraform simple avec un module personnalisé, incluant les étapes pour initialiser, planifier, appliquer et détruire l'infrastructure.