"use server";

import store from "store";

export const setStore = (key, value) => {
  store.set(key, value);
};

export const getStore = (key) => {
  return store.get(key);
};

export const removeStore = (key) => {
  store.remove(key);
};

export const clearStore = () => {
  store.clear();
};

export const allStore = () => {
  return store.all();
};
