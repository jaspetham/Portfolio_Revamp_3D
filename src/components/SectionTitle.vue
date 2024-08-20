<template>
  <div class="relative top-0 w-full">
    <div class="page-title">
      {{title}}
    </div>
    <div class="page-subtitle">
      <span v-for="(subtitle,index) in subTitles" :key="index">
        {{subtitle}}
      </span>
    </div>
  </div>
</template>

<script setup>
    import { defineProps }  from 'vue';
    const props = defineProps({
        title:{
            type:String,
            required:true
        },
        subTitles: {
            type: Array,
            required:true
        }
    })
</script>

<style lang="css" scoped>
  .page-title {
    user-select: none;
    white-space: nowrap;
    position: absolute;
    top: 12vh;
    font-size: 28vh;
    font-family: futura-pt;
    color: #fff;
    text-transform: uppercase;
    margin: 0;
    pointer-events: none;
    margin: 0 auto;
    width: 100vw;
    text-align: center;
    color: rgba(255,255,255,.1);
    letter-spacing: 2vh;
    font-weight: 100;
  }
  .page-subtitle {
    user-select: none;
    position: relative;
    white-space: nowrap;
    pointer-events: none;
    top: 32vh;
    margin: 0 auto;
    color: rgba(255,255,255,.5);
    text-transform: uppercase;
    letter-spacing: 0.5vw;
    font-size: .9vw;
    text-align: center;
    display: flex;
    justify-content: center;
    align-items: center;
    column-gap: 3rem;
  }
  span{
    position: relative;
    line-height: 100%;
  }
  span:not(:last-child)::after{
    content:'';
    position:absolute;
    right:-1.5rem;
    top:0;
    width:2px;
    height:100%;
    background:rgba(255,255,255,.5);
    border-radius: 25px;
  }
  @media only screen and (max-width: 801px){
    .page-title {
      font-size: 7vh;
    }
    .page-subtitle {
      top: 17vh;
      font-size: 1vh;
      letter-spacing: .5vh;
      column-gap: 1rem;
    }
    span:not(:last-child)::after{
      right:-0.5rem;
    }
  }
</style>
