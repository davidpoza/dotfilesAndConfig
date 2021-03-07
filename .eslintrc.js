/*
Needs following dependencies:

eslint
eslint-config-airbnb-base
eslint-plugin-import
eslint-plugin-jsx-a11y
eslint-plugin-react
eslint-plugin-react-hooks
eslint-import-resolver-webpack
*/

module.exports = {
  env: {
    browser: true,
    node: true,
    commonjs: true,
    es2021: true,
  },
  settings: {
    'import/resolver': {
      webpack: {
        config: {
          resolve: {
            extensions: [
              '.js',
              '.jsx',
            ],
          },
        },
      },
    },
  },
  extends: [
    'plugin:react/recommended',
    'airbnb-base',
  ],
  parserOptions: {
    ecmaFeatures: {
      jsx: true,
    },
    ecmaVersion: 12,
    sourceType: 'module',
  },
  plugins: [
    'react',
  ],
  rules: {
    'max-len': [2, 120, 2],
    'import/extensions': ['error', 'always', {
      ts: 'never',
      tsx: 'never',
      js: 'never',
      jsx: 'never',
    }],
    'import/no-extraneous-dependencies': ['error', { devDependencies: true }],
    'import/no-unresolved': ['error'],
    'import/prefer-default-export': 'off',
    'import/no-named-default': 'off',
  },
};

