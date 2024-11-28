<template>
  <!-- Navbar -->
  <nav class="fixed top-0 w-full bg-white/90 backdrop-blur-sm z-50 shadow-sm">
        <div class="container mx-auto px-4 py-4 flex justify-between items-center">
          <img :src="logoUrl" alt="HP FlowerPatch" class="h-12" />
          <div class="hidden md:flex space-x-6">
            <a v-for="link in ['Home', 'Categories', 'Best Sellers', 'About Us','Contact Us']" 
               :key="link" 
               href="#" 
               class="text-gray-700 hover:text-[#C33F6B] transition-colors">
              {{ link }}
            </a>
          </div>
          <button class="bg-[#C33F6B] text-white px-6 py-2 rounded-full hover:bg-[#b63761] transition-colors">
            Order Now
          </button>
        </div>
      </nav>
</template>

<script setup>
import { ref } from 'vue'

const isMenuOpen = ref(false)
const logoUrl = 'https://res.cloudinary.com/dcmwnrvzk/image/upload/v1732284199/flowers-logo_i4m7mv.png'

const navLinks = [
  { href: '#home', text: 'Home' },
  { href: '#categories', text: 'Categories' },
  { href: '#bestsellers', text: 'Best Sellers' },
  { href: '#about', text: 'About' },
  { href: '#contact', text: 'Contact' }
]
</script>