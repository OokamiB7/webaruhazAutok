<template>
  <div class="p-3 my-width-login loginBody">
    <!-- user name -->
    <!-- <div class="mb-3">
      <label for="userName" class="form-label szoveg">User name:</label>
      <input
        type="text"
        class="form-control"
        id="userName"
        v-model="storeLogin.userName"
      />
    </div> -->
    <!-- password -->
    <!-- <div class="mb-3">
      <label for="password" class="form-label szoveg">Password:</label>
      <input
        type="password"
        class="form-control"
        id="password"
        v-model="storeLogin.password"
      />
    </div> -->
    <!-- Button login -->
    <!-- <button type="button" class="btn btn-primary mb-3" @click="login()">
      Login
    </button>

    <div v-if="loginErrorMessage" class="alert alert-danger" role="alert">
      {{ loginErrorMessage }}
    </div> -->

    <div class="container">
	<h2 class="title">Bejelentkezés</h2>
	<form class="form" method="POST">

		<label for="username" class="labelek">Felhasználónév</label>

		<input type="text" id="userName" class="input" placeholder="..." v-model="storeLogin.userName"/>

		<label for="password" class="labelek">Jelszó</label>

		<input type="password" id="password" class="input" placeholder="..." v-model="storeLogin.password"/>

		<button type="button" id="loginButton" @click="login()">Login</button>
    <div v-if="loginErrorMessage" class="alert alert-danger" role="alert">
      {{ loginErrorMessage }}
    </div>
	</form>
</div>



  </div>
</template>

<script>

import { useUrlStore } from "@/stores/url";
const storeUrl = useUrlStore();
import { useLoginStore } from "@/stores/login";
import router from "../router";
const storeLogin = useLoginStore();
export default {
  data() {
    return {
      storeUrl,
      storeLogin,
      loginErrorMessage: null,
    };
  },
  methods: {
    loginErrorMessageShow(message) {
      this.loginErrorMessage = message;
      setTimeout(() => {
        this.loginErrorMessage = null;
      }, 3000);
    },
    async login() {
      const url = this.storeUrl.urlLogin;
      const user = {
        userName: this.storeLogin.userName,
        password: this.storeLogin.password,
      };
      const config = {
        method: "POST",
        headers: {
          Accept: "application/json",
          "Content-Type": "application/json",
        },
        body: JSON.stringify(user),
      };
      try {
        // this.errorMessage = null;
        const response = await fetch(url, config);
        if (!response.ok) {
          this.loginErrorMessageShow("Server error 1");
          return;
        }
        const data = await response.json();
        if (data.success) {
          //sikeres bejelentkezés
          this.storeLogin.loginSuccess = data.success;
          this.storeLogin.accessToken = data.data.accessToken;
          this.storeLogin.refreshToken = data.data.refreshToken;
          this.storeLogin.userId = data.data.userId;
          this.storeLogin.number = data.data.number;
          this.storeLogin.loginSuccess = data.success;
          this.storeLogin.accessTime = parseInt(data.data.accessTime);
          await this.postLoggedinusers();
          router.push("/");
          // this.timer();
          // this.getTodos();
        } else {
          //sikertelen bejelenkezés
          this.loginErrorMessageShow("Hibás usernév vagy jelszó");
        }
      } catch (error) {
        // this.errorMessage = `Server error`;
        this.loginErrorMessageShow("Server error 2");
      }
    },
    async postLoggedinusers(){
      const loggedinusers = 
      {userId: this.storeLogin.userId}
      const url = this.storeUrl.urlLoggedinusers; 

      const config = {
        method: "POST",
        headers: {
          Accept: "application/json",
          "Content-Type": "application/json",
        },
        body: JSON.stringify(loggedinusers),
      };

      const response = await fetch (url,config)
      const data = await response.json();
      this.storeLogin.shoppingId = data.data.id;
          // console.log("xxx", url, data);



    }    
  },
  
};
</script>

<style>

.loginBody{
  backdrop-filter: blur(10px);
}


.labelek{
  color: gold;
}

.container {
	max-width: 400px;
	width: 100%;
  background: linear-gradient(to right, #859398, #283048); 
	padding: 20px;
	border-radius: 20px;
	position: relative;
}



.form {
	display: flex;
	flex-direction: column;
}

.title {
	text-align: center;

  color: gold;
}



label {
	margin-top: 20px;
	font-size: 12px;
	color: rgb(77, 77, 77);
	font-weight: 600;
}

.input {
	padding: 8px;
	outline: none;
	border: 0;
	background: #EEE;
}

#loginButton {
	background: linear-gradient(60deg, #E21143, #FFB03A);
  margin-top: 20px;
	padding: 8px;
	border: 0;
	color: #fff;
	font-size: 15px;
	letter-spacing: 1px;
	text-transform: uppercase;
}

</style>