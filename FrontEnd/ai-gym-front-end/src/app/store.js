import { configureStore } from '@reduxjs/toolkit';
import configureReducer from '../features/configure/configureSlice';

export const store = configureStore({
  reducer: {
    configure: configureReducer,
  },
});
