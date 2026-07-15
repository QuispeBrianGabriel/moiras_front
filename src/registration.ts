export interface RegistrationInput {
  email: string;
  password: string;
}

export interface RegistrationResult {
  ok: boolean;
  error?: string;
}

export function registerUser(input: RegistrationInput): RegistrationResult {
  if (!input.email.includes('@')) {
    return { ok: false, error: 'Email inválido' };
  }

  if (input.password.length < 8) {
    return {
      ok: false,
      error: 'La contraseña debe tener al menos 8 caracteres',
    };
  }

  return { ok: true };
}
