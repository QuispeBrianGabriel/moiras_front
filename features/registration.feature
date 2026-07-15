# language: es
Característica: Registro de usuario

  Escenario: Registro exitoso con datos válidos
    Dado que un usuario ingresa el email "user@test.com" y la contraseña "12345678"
    Cuando intenta registrarse
    Entonces el registro debería ser exitoso
