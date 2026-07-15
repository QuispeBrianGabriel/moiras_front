import { describe, expect, it } from 'vitest';

import { registerUser } from './registration';

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
});
