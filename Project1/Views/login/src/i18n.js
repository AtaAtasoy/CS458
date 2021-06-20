import i18n from 'i18next';
import { initReactI18next } from 'react-i18next';

const resources = {
  en: {
    translation: {
      'bilkent_logo_url': '/bilkent_en_logo.jpg',
      'Reset Password': 'Reset Password',
      'Bilkent ID': 'Bilkent ID',
      'Password': 'Password',
      'Login': 'Login'
    }
  },
  tr: {
    translation: {
      'bilkent_logo_url': '/bilkent_tr_logo.jpg',
      'Reset Password': 'Şifre Sıfırla',
      'Bilkent ID': 'Bilkent No',
      'Password': 'Şifre',
      'Login': 'Giriş'
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