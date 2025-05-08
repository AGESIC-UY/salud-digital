# ?? Producto Cross-Enterprise Document Sharing (XDS)

El **Producto Cross-Enterprise Document Sharing (XDS por su sigla en ingl��s)** brinda un repositorio para documentos cl��nicos y un registro para la metadata siguiendo el perfil XDS, que es un perfil de interoperabilidad desarrollado por IHE con el prop��sito de simplificar el registro, distribuci��n y acceso a la Historia Cl��nica Electr��nica (HCE) del usuario por parte de prestadores e instituciones.

El producto XDS est�� compuesto de tres elementos principales:
- **XDSBUS**: componente responsable de exponer los webs services para la consulta y escritura del XDS local de cada Instituci��n y en el Registro XDS Nacional.
- **REPOSITORIO**: base de datos donde se almacenan los documentos cl��nicos.
- **REGISTRO**: base de datos donde se almacena la metadata asociada a los documentos cl��nic

Y tres m��dulos complementarios:
- **MAA (M��dulo de Auditor��a ATNA)**: m��dulo que se encuentra integrado al BUS, a trav��s del cual se pueden registrar todas las transacciones que se intercambian entre el HIS, XDS y la Plataforma HCEN.
- **MCD (M��dulo Control de Datos)**: m��dulo que se encuentra integrado al BUS y provee las funcionalidades necesarias para validar la estructura y los datos de los mensajes asociados las transacciones.
- **MGM (M��dulo Gesti��n de Mensajer��a)**: m��dulo encargado de reprocesar mensajes que, debido a errores de comunicaci��n, no se han podido enviar desde el XDSBUS hacia el Repositorio XDS o hacia la Plataforma de Salud.

El producto XDS contribuye significativamente a la interoperabilidad entre instituciones y Plataforma HCEN, facilitando la integraci��n entre sistemas.
---
## ?? ��ltima Versi��n

- **XDS v6.0 (16/12/2024)**  
