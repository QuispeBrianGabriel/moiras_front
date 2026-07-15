import assert from 'node:assert/strict';

import { Given, Then, When } from '@cucumber/cucumber';

import { registerUser } from '../../src/registration.ts';

let input: { email: string; password: string };
let result: ReturnType<typeof registerUser>;

Given(
  'que un usuario ingresa el email {string} y la contraseña {string}',
  function (email: string, password: string) {
    input = { email, password };
  },
);

When('intenta registrarse', function () {
  result = registerUser(input);
});

Then('el registro debería ser exitoso', function () {
  assert.equal(result.ok, true);
});
