import i18n from 'i18next';
import { initReactI18next } from 'react-i18next';

const resources = {
  en: {
    translation: {
      'bilkent_logo_url': '/bilkent_en_logo.jpg',
      'Reset Password': 'Reset Password',
      'Bilkent ID': 'Bilkent ID',
      'Password': 'Password',
      'Login': 'Login',
      'Empty Bilkent ID Prompt': 'Bilkent ID cannot be blank.',
      'Empty Password Prompt': 'Password cannot be blank.',
      'Invalid Credential Prompt': 'Wrong password or Bilkent ID number.',
      'Change Language': 'Türkçe'
    }
  },
  tr: {
    translation: {
      'bilkent_logo_url': '/bilkent_tr_logo.jpg',
      'Reset Password': 'Şifre Sıfırla',
      'Bilkent ID': 'Bilkent No',
      'Password': 'Şifre',
      'Login': 'Giriş',
      'Empty Bilkent ID Prompt': 'Bilkent No boş bırakılamaz.',
      'Empty Password Prompt': 'Şifre boş bırakılamaz.',
      'Invalid Credential Prompt': 'Şifre ya da Bilkent kimlik numarası hatalı.',
      'Change Language': 'English'
    }
  }
};

i18n.use(initReactI18next).init({
  resources,
  lng: 'tr',

  interpolation: {
    escapeValue: false
  }
});

export default i18n;