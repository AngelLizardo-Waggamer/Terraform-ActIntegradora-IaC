# Scripts para generar infraestructura en la nube de QuickInv
Estos scripts generan la infraestructura necesaria para alojar el sistema de QuickInv en la nube de AWS. El diagrama reducido de la infraestructura es el siguiente:

![Infra](InfraDiagram.png)
> [!NOTE]
> Un dato curioso de la infraestructura real generada por el archivo de Terraform es que se tiene que incluir un NAT Gateway porque sino los nodos del clúster de EKS no pueden inicializarse. 

## Autores
* [Angel](https://github.com/AngelLizardo-Waggamer)
* [Alan](https://github.com/alanbalfonso)
* [Luis Enrique](https://github.com/mrfuzball08)

> [!IMPORTANT]
> Lo queremos mucho profe :)