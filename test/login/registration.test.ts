import { describe, expect, it } from 'vitest';

import { registerUser } from '../../src/login/registration';

describe('registerUser', () => {
  it('registra ok con datos validos', () => {
    const result = registerUser({
      email: 'user@test.com',
      password: '12345678',
    });
    expect(result.ok).toBe(true);
  });

  it('falla si el email no tiene arroba', () => {
    const result = registerUser({
      email: 'usertest.com',
      password: '12345678',
    });
    expect(result.ok).toBe(false);
  });

  it('falla si la contraseña tiene menos de 8 caracteres', () => {
    const result = registerUser({
      email: 'user@test.com',
      password: '1234567',
    });
    expect(result.ok).toBe(false);
    expect(result.error).toBe('La contraseña debe tener al menos 8 caracteres');
  });
});
