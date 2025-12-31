import store from "store";

export const setStore = async (key, value) => {
  if (typeof value === "object") value = JSON.stringify(value);
  await store.set(key, value);
  // appState[key] = value;
};

export const getStore = async (key) => {
  return await store.get(key);
};

export const removeStore = async (key) => {
  await store.remove(key);
};

export const clearStore = async () => {
  await store.clear();
};

export const allStore = async () => {
  return await store.all();
};
