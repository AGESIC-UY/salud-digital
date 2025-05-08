# ?? Producto Cross-Enterprise Document Sharing (XDS)

El **Producto Cross-Enterprise Document Sharing (XDS por su sigla en ingl谷s)** brinda un repositorio para documentos cl赤nicos y un registro para la metadata siguiendo el perfil XDS, que es un perfil de interoperabilidad desarrollado por IHE con el prop車sito de simplificar el registro, distribuci車n y acceso a la Historia Cl赤nica Electr車nica (HCE) del usuario por parte de prestadores e instituciones.

El producto XDS est芍 compuesto de tres elementos principales:
- **XDSBUS**: componente responsable de exponer los webs services para la consulta y escritura del XDS local de cada Instituci車n y en el Registro XDS Nacional.
- **REPOSITORIO**: base de datos donde se almacenan los documentos cl赤nicos.
- **REGISTRO**: base de datos donde se almacena la metadata asociada a los documentos cl赤nic

Y tres m車dulos complementarios:
- **MAA (M車dulo de Auditor赤a ATNA)**: m車dulo que se encuentra integrado al BUS, a trav谷s del cual se pueden registrar todas las transacciones que se intercambian entre el HIS, XDS y la Plataforma HCEN.
- **MCD (M車dulo Control de Datos)**: m車dulo que se encuentra integrado al BUS y provee las funcionalidades necesarias para validar la estructura y los datos de los mensajes asociados las transacciones.
- **MGM (M車dulo Gesti車n de Mensajer赤a)**: m車dulo encargado de reprocesar mensajes que, debido a errores de comunicaci車n, no se han podido enviar desde el XDSBUS hacia el Repositorio XDS o hacia la Plataforma de Salud.

El producto XDS contribuye significativamente a la interoperabilidad entre instituciones y Plataforma HCEN, facilitando la integraci車n entre sistemas.
---
## ?? 迆ltima Versi車n

- **XDS v6.0 (16/12/2024)**  
