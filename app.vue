<template>
  <div class="overflow-x-hidden">
    <TheNavbar />
    <HeroSection />
    <FeaturedCategories />
    <BestSellers />
    <AboutUs />
    <Testimonials />
    <ContactNewsletter />
    <TheFooter />
  </div>
</template>

<script setup>
import TheNavbar from '~/components/layout/TheNavbar.vue'
import HeroSection from '~/components/sections/HeroSection.vue'
import FeaturedCategories from '~/components/sections/FeaturedCategories.vue'
import BestSellers from '~/components/sections/BestSellers.vue'
import SeasonalOffers from '~/components/sections/SeasonalOffers.vue'
import AboutUs from '~/components/sections/AboutUs.vue'
import Testimonials from '~/components/sections/Testimonials.vue'
import DeliveryInfo from '~/components/sections/DeliveryInfo.vue'
import ContactNewsletter from '~/components/sections/ContactNewsletter.vue'
import TheFooter from '~/components/layout/TheFooter.vue'
</script>

<style>
html {
  scroll-behavior: smooth;
}

body {
  font-family: 'Inter', sans-serif;
}

.section-title {
  @apply text-4xl md:text-5xl font-display font-bold text-center mb-12;
}

.section-subtitle {
  @apply text-xl text-gray-600 text-center mb-16 max-w-3xl mx-auto;
}
</style>