/*
Needs following dependencies:

npm install -g eslint
npm install -g eslint-config-airbnb
npm install -g eslint-config-airbnb-base
npm install -g eslint-plugin-import
npm install -g eslint-plugin-jsx-a11y
npm install -g eslint-plugin-react
npm install -g eslint-plugin-react-hooks
npm install -g eslint-import-resolver-webpack
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
    'react/display-name': 'off',
    'no-unused-vars': ['warn'],
  },
};

