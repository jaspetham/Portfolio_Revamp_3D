<script setup>
import SectionTitle from '@/components/SectionTitle.vue';
import history from '@/assets/json/history.json';
import { ref } from 'vue';
import Container from '@/components/Container.vue';
import DownloadCV from '@/components/DownloadCV.vue';

const graduations = ref(history.graduations);
const works = ref(history.works);
</script>
<template>
  <Container>
    <SectionTitle :title="'history'" :subTitles="['Educations', 'Work Experience']"/>
    <div class="list list-content">
      <div class="divider"></div>
      <div class="wrapper">
        <div class="grid md:grid-cols-2 grid-cols-1 gap-6">
          <div class="info-content">
            <h1 class="info-title mb-5">Educations</h1>
            <ul class="list-unstyled">
              <li v-for="(graduation,index) in graduations" :key="index">
                <div class="flex gap-4">
                  <div class="relative content-icon">
                    <div class="icon">
                    </div>
                  </div>
                  <div class="content">
                    <div class="year">{{graduation.year}}</div>
                    <h1 class="info-title">
                      {{graduation.type}}
                    </h1>
                    <span class="info-subtitle">{{graduation.school}}</span>
                    <p class="info-text">{{graduation.info}}</p>
                  </div>
                </div>
              </li>
            </ul>
          </div>
          <div class="info-content">
            <h1 class="info-title mb-5">Work Experience</h1>
            <ul class="list-unstyled">
              <li v-for="(work,index) in works" :key="index">
                <div class="flex gap-4">
                  <div class="relative content-icon">
                    <div class="icon">
                    </div>
                  </div>
                  <div class="content">
                    <div class="year">{{work.year}}</div>
                    <h1 class="info-title">
                      {{work.type}}
                    </h1>
                    <span class="info-subtitle">{{work.school}}</span>
                    <p class="info-text">{{work.info}}</p>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </div>
        <div class="divider"></div>
        <div class="flex justify-center">
          <DownloadCV/>
        </div>
      </div>
    </div>
  </Container>
</template>
<style lang="css" scoped>
  div.wrapper{
    margin-inline: auto;
    width: 90vw;
    padding-bottom:10vw;
  }
  .info-content .year{
    font-size:0.8vw;
    background:var(--clr-main);
    color:rgba(0, 0, 0, .6);
    width: fit-content;
    padding: 0.25rem 1rem;
    border-radius:25px;
    margin-bottom:1rem;
  }
  .info-content :is(.info-title,.icon), .btn{
    font-size:1.4vw;
  }
  .info-content .info-subtitle{
    font-size: 1.2vw;
    opacity: .8;
    position: relative;
  }
  .info-content .info-text{
    font-size:1.2vw;
    text-transform: none;
    margin-top:1.5rem;
  }
  .icon{
    padding:.75rem;
    text-align: center;
    z-index: 1;
    border-radius: 50%;
    color: #fff;
    background-color: var(--clr-main);
    display:flex;
    align-content: center;
    justify-content: center;
    position: relative;
  }
  ul > li{
    text-transform: uppercase;
    position: relative;
    margin-bottom:2.5rem;
  }
  ul > li:last-child{
    margin-bottom:0;
  }

  .content-icon::after{
    content: "";
    position: absolute;
    top:0;
    width:3px;
    border-radius:15px;
    height:100%;
    background:var(--clr-main);
    left: 50%;
    transform: translateX(-50%);
  }

  @media only screen and (max-width: 801px){
    .info-content :is(.info-title,.icon), .btn {
      font-size: 2.5vh;
    }
    .info-content .info-subtitle{
      font-size: 2vh;
      display:block;
    }
    .info-content .info-subtitle::before{
      display:none;
    }
    .info-content .info-text{
      font-size:2vh;
      margin-top:.75rem;
    }
    .info-content .year{
      font-size:1.75vh;
      margin-bottom:.75rem;
    }
  }
</style>