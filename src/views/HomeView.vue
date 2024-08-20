<script setup></script>

<template>
  <div class="h-screen flex items-center justify-center relative z-10">
    <div class="title-wrap">
      <h1 class="title clr text-white">Jasper Tham</h1>
      <p class="sub-title">Front end developer</p>
    </div>
  </div>
</template>

<style lang="css" scoped>
  .title-wrap{
    top: 50%;
    left: 50%;
    width: 100%;
    z-index: 100;
    position: absolute;
    transform: translate(-50%, -50%);
    text-align: center;
    margin: 0;
    padding: 0;
  }
  .title{
    text-transform: uppercase;
    text-align: center;
    font-size: 5vw;
    letter-spacing: 2.6vw;
    color: var(--clr-main);
    color: hsla(var(--hsl-main), 1);
    filter: drop-shadow(0px 6px 10px var(--clr-main));
    text-indent: 2.6vw;
    opacity: 1;
    font-weight: 300;
    position: relative;
    top: 0;
    left: auto;
    transform: none;
    padding: 0;
    margin: 0;
    position: relative;
  }
  .sub-title{
    text-transform: uppercase;
    text-align: center;
    font-size: 1.5vw;
    letter-spacing: 1.75vw;
    text-indent: 1.8vw;
    top: 0;
    left: auto;
    transform: none;
    padding: 0;
    margin: 0;
    position: relative;
    color:var(--clr-main);
  }
  @media only screen and (max-width: 801px){
    .home .title {
      font-size: 8vw;
    }
    .home .sub-title {
      font-size: 2.2vw;
    }
  }
</style>
