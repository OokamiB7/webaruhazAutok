import { defineStore } from "pinia";

export const useUrlStore = defineStore({
    id: "url",
    state: () => ({
        urlData: "http://localhost:3000",
        urlAuth: "http://localhost:4000",
    }),
    getters: {
        urlLogin() {
            return `${this.urlAuth}/login`;
        },
        urlLogout() {
            return `${this.urlAuth}/logout`;
        },
        urlToken() {
            return `${this.urlAuth}/token`;
        },
        urlCars() {
            return `${this.urlData}/cars`
        },
        urlCarsTrips() {
            return `${this.urlData}/carsTrips`
        },
        urlCarsWithDrivers() {
            return `${this.urlData}/carsWithDrivers`
        },
        urlCarsWithDriversReal() {
            return `${this.urlData}/carsWithDriversReal`
        },
        urlDriversAbc() {
            return `${this.urlData}/driversAbc`
        },
        urlFreeDriversAbc() {
            return `${this.urlData}/freeDriversAbc`
        },
        urlTripsByCarId() {
            return `${this.urlData}/tripsByCarId`
        },
        urlTrips() {
            return `${this.urlData}/trips`
        },
        urlLoggedinusers() {
            return `${this.urlData}/loggedinusers`
        },
        urlProducts() {
            return `${this.urlData}/products`
        },
        urlProductsSzur() {
            return `${this.urlData}/productsSzur`
        },
        urlCart() {
            return `${this.urlData}/cart`
        },
        urlCartQuantity() {
            return `${this.urlData}/cartQuantity`
        },
        urlCartByShoppingId() {
            return `${this.urlData}/cartByShoppingId`
        },
    },
});