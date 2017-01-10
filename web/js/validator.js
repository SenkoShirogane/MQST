$(document).ready(function(){ //Para que jurule al cargar la página x3 
    $('#FormLogin').bootstrapValidator({
        message: 'Este valor no es valido',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            UsuarioCliente: {
                validators: {
                    notEmpty: { message: 'El nombre de usuario es requerido' },
                    stringLength: {  min: 5, message: 'Mínimo 5 caracteres' }
                }
            },
            ContrasenaCliente: {
                validators: { notEmpty: { message: 'La contraseña es requerida' } }
            }
        }
    });
});

$(document).ready(function(){ //Para que jurule al cargar la página x3 
    $('#Registro').bootstrapValidator({
        message: 'Este valor no es válido',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            NombreCliente:  {
                validators: {
                    notEmpty: { message: '¡Tu nombre es requerido!' },
                    stringLength: { max: 25, message: 'Máximo 25 caracteres' }
                }
            },
            ApPatCliente:  {
                validators: {
                    notEmpty: { message: 'El Apellido Paterno es requerido' },
                    stringLength: { max: 25, message: 'Máximo 25 caracteres' }
                }
            },
            ApMatCliente:  {
                validators: {
                    notEmpty: { message: 'El Apellido Materno es requerido' },
                    stringLength: { max: 25, message: 'Mínimo 5 caracteres y máximo 12' }
                }
            },
            UsuarioCliente: {
                validators: {
                    notEmpty: { message: 'El nombre de usuario es requerido' },
                    stringLength: { min: 5, message: 'Mínimo 5 caracteres y máximo 12' },
                    different: { field: 'ContrasenaCliente', message: 'El Usuario y la contraseña no pueden ser la misma.' }
                }
            }, 
            CorreoCliente: {
                validators: {
                    notEmpty: { message: 'El E-mail es requerido' },
                    stringLength: { max: 25, message: 'Máximo 25 caracteres' },
                    emailAddress: { message: 'El E-mail no es válido' }
                }
            }, 
            CorreoCliente2: {
                validators: {
                    notEmpty: { message: 'Ingresa nuevamente el E-mail' },
                    stringLength: { max: 25, message: 'Máximo 25 caracteres' },
                    emailAddress: { message: 'El E-mail no es válido' },
                    identical: { field: 'CorreoCliente', message: "No coinciden los E-mail" }
                }
            }, 
            ContrasenaCliente: {
                validators: {
                    notEmpty: { message: 'La contraseña es requerida' },
                    stringLength: { min: 8, message: 'Mínimo 8 caracteres' },
                    different: { field: 'UsuarioCliente', message: 'El Usuario y la contraseña no pueden ser la misma.' }
                }
            },
            ContrasenaCliente2: {
                validators: {
                    notEmpty: { message: 'Ingresa nuevamente tu contraseña' },
                    stringLength: { min: 8, message: 'Mínimo 8 caracteres' },
                    identical: { field: 'ContrasenaCliente', message: "¡No coinciden las Contraseñas!" }
                }
            },
            EstadoCliente: {
                validators: {
                    notEmpty: { message: 'Ingresa el Estado donde vives.' },
                    stringLength: { max: 40, message: 'Máximo 40 caracteres' }
                }
            },
            MunicipioCliente: {
                validators: {
                    notEmpty: { message: 'Ingresa el Municipio o Delegación donde vives.' },
                    stringLength: { max: 40, message: 'Máximo 40 caracteres' }
                }
            },
            ColoniaCliente: {
                validators: {
                    notEmpty: { message: 'Ingresa la Colonia donde vives.' },
                    stringLength: { max: 40, message: 'Máximo 40 caracteres' }
                }
            },
            CPCliente: {
                validators: {
                    notEmpty: { message: 'Ingresa el Código Postal de donde vives.' },
                    between: { min: 0, max: 999999, message: 'Ingresa un valor válido.' },
                    numeric: { message: '¡Ese no es un número!' },
                    greaterThan: { value: 0,  message: 'El valor ingresado debe ser mayor a cero.' },
                    integer:{message: 'Ingresa un valor numérico.'}
                }
            },
            CalleCliente: {
                validators: {
                    notEmpty: { message: 'Ingresa la calle donde vives.' },
                    stringLength: { max: 50, message: 'Máximo 50 caracteres' }
                }
            },
            NumeroCliente: {
                validators: {
                    notEmpty: { message: 'Ingresa el Número Exterior de donde vives.' },
                    between: { min: 0, max: 99999, message: 'Ingresa un valor válido.' },
                    numeric: { message: '¡Ese no es un número!' },
                    greaterThan: { value: 0,  message: 'El valor ingresado debe ser mayor a cero.' },
                    integer:{message: 'Ingresa un valor numérico.'}
                }
            },
            TelCasaCliente: {
                validators: {
                    notEmpty: { message: 'Ingresa el Número Telefónico de donde vives.' },
                    numeric: { message: '¡Ese no es un número!' },
                    greaterThan: { value: 0,  message: 'El valor ingresado debe ser mayor a cero.' },
                    integer:{message: 'Ingresa un valor numérico.'}
                }
            },
            TelCelCliente: {
                validators: {
                    notEmpty: { message: 'Ingresa tu Número celular.' },
                    numeric: { message: '¡Ese no es un número!' },
                    greaterThan: { value: 0,  message: 'El valor ingresado debe ser mayor a cero.' },
                    integer:{message: 'Ingresa un valor numérico.'}
                }
            },
            Condiciones: {
                validators: { notEmpty: { message: 'Marca esta casilla.' } }
            }
        }
    });
});

$(document).ready(function(){ //Para que jurule al cargar la página x3 
    $('#AgregarProducto').bootstrapValidator({
        message: 'Este valor no es valido',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            ProductoNuevo: {
                validators: {
                    notEmpty: { message: 'El nombre del Producto es requerido' },
                    stringLength: {  max: 30, message: 'Máximo 30 carácteres' }
                } 
            },
            CostoNuevo: {
                validators: {
                    notEmpty: { message: 'Ingresa el Costo para el Producto.' },
                    numeric: { message: '¡Ese no es un número!' },
                    greaterThan: { value: 0,  message: 'El valor debe ser mayor a cero.' }
                }
            },
            EstadoProducto: {
                threshold: 10,
                validators: {
                    notEmpty: { enabled: false }
                }
            },
            imagen: {
                validators: {
                    notEmpty: { message: 'Ingresa una imagen' },
                    file: {
                        extension: 'jpeg,jpg,png,gif',
                        type: 'image/jpeg,image/png,image/gif',
                        maxSize: 2097152,   // 2048 * 1024
                        message: 'Sólo se aceptan imágenes jpg, png y gif.'
                    }
                }
            },
            detalles: {
                validators: {
                    notEmpty: { message: 'La descripción del producto es requerida' },
                    stringLength: {  max: 50, message: 'Máximo 50 carácteres' }
                }
            }
        }
    });
});

$(document).ready(function(){ //Para que jurule al cargar la página x3 
    $('#AgregarProveedor').bootstrapValidator({
        message: 'Este valor no es válido',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            NombreProveedor:  {
                validators: {
                    notEmpty: { message: 'Ingresa el nombre del proveedor.' },
                    stringLength: { max: 25, message: 'Máximo 25 caracteres' }
                }
            },
            ApPatProveedor:  {
                validators: {
                    notEmpty: { message: 'El Apellido Paterno es requerido.' },
                    stringLength: { max: 25, message: 'Máximo 25 caracteres' }
                }
            },
            ApMatProveedor:  {
                validators: {
                    notEmpty: { message: 'El Apellido Materno es requerido.' },
                    stringLength: { max: 25, message: 'Mínimo 5 caracteres y máximo 12' }
                }
            },
            EmpresaProveedor:  {
                validators: {
                    notEmpty: { message: 'La Empresa proveedora es requerida.' },
                    stringLength: { max: 30, message: 'Máximo 30 caracteres' }
                }
            },
            CorreoProveedor: {
                validators: {
                    notEmpty: { message: 'El E-mail es requerido' },
                    stringLength: { max: 30, message: 'Máximo 30 caracteres' },
                    emailAddress: { message: 'El E-mail no es válido' }
                }
            }, 
            CorreoProveedor2: {
                validators: {
                    notEmpty: { message: 'Ingresa nuevamente el E-mail' },
                    stringLength: { max: 30, message: 'Máximo 30 caracteres' },
                    emailAddress: { message: 'El E-mail no es válido' },
                    identical: { field: 'CorreoProveedor', message: "No coinciden los E-mail" }
                }
            }, 
            EstadoProveedor: {
                validators: {
                    notEmpty: { message: 'Ingresa el Estado donde se encuentra la Empresa.' },
                    stringLength: { max: 40, message: 'Máximo 40 caracteres' }
                }
            },
            MunicipioProveedor: {
                validators: {
                    notEmpty: { message: 'Ingresa el Municipio o Delegación.' },
                    stringLength: { max: 40, message: 'Máximo 40 caracteres' }
                }
            },
            ColoniaProveedor: {
                validators: {
                    notEmpty: { message: 'Ingresa la Colonia donde se encuentra la Empresa.' },
                    stringLength: { max: 40, message: 'Máximo 40 caracteres' }
                }
            },
            CPProveedor: {
                validators: {
                    notEmpty: { message: 'Ingresa el Código Postal.' },
                    between: { min: 0, max: 999999, message: 'Ingresa un valor válido.' },
                    numeric: { message: '¡Ese no es un número!' },
                    greaterThan: { value: 0,  message: 'El valor ingresado debe ser mayor a cero.' },
                    integer:{message: 'Ingresa un valor numérico.'}
                }
            },
            CalleProveedor: {
                validators: {
                    notEmpty: { message: 'Ingresa el nombre de la calle.' },
                    stringLength: { max: 50, message: 'Máximo 50 caracteres' }
                }
            },
            NumeroProveedor: {
                validators: {
                    notEmpty: { message: 'Ingresa el Número Exterior de donde se encuentra la Empresa.' },
                    between: { min: 0, max: 99999, message: 'Ingresa un valor válido.' },
                    numeric: { message: '¡Ese no es un número!' },
                    greaterThan: { value: 0,  message: 'El valor ingresado debe ser mayor a cero.' },
                    integer:{message: 'Ingresa un valor numérico.'}
                }
            },
            TelCasaProveedor: {
                validators: {
                    notEmpty: { message: 'Ingresa el Número Telefónico de la Empresa proveedora.' },
                    numeric: { message: '¡Ese no es un número!' },
                    greaterThan: { value: 0,  message: 'El valor ingresado debe ser mayor a cero.' },
                    integer:{message: 'Ingresa un valor numérico.'}
                }
            },
            TelCelProveedor: {
                validators: {
                    notEmpty: { message: 'Ingresa el Número celular del proveedor.' },
                    numeric: { message: '¡Ese no es un número!' },
                    greaterThan: { value: 0,  message: 'El valor ingresado debe ser mayor a cero.' },
                    integer:{message: 'Ingresa un valor numérico.'}
                }
            }
        }
    });
});