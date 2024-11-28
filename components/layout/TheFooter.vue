<template>
  <!-- Footer -->
  <footer class="bg-gray-900 text-white py-12">
        <div class="container mx-auto px-4">
          <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
            <div>
              <img :src="logoUrl" alt="HP FlowerPatch" class="h-12 mb-4" />
              <p class="text-gray-400">
                Bringing joy through flowers, crafted with love.
              </p>
            </div>
            <div>
              <h3 class="text-lg font-semibold mb-4">Quick Links</h3>
              <ul class="space-y-2">
                <li v-for="link in ['Home', 'Shop', 'About', 'Contact']" :key="link">
                  <a href="#" class="text-gray-400 hover:text-white transition-colors">{{ link }}</a>
                </li>
              </ul>
            </div>
            <div>
              <h3 class="text-lg font-semibold mb-4">Contact</h3>
              <ul class="space-y-2 text-gray-400">
                <li>ezekiel.edith@gmail.com</li>
                <li>+255 742 551 552</li>
                <li>hptagency.co.tz</li>
              </ul>
            </div>
            <div>
              <h3 class="text-lg font-semibold mb-4">Newsletter</h3>
              <p class="text-gray-400 mb-4">Subscribe for updates and exclusive offers!</p>
              <div class="flex">
                <input type="email" placeholder="Your email" class="px-4 py-2 rounded-l-lg w-full" />
                <button class="bg-[#C33F6B] px-4 rounded-r-lg hover:bg-[#b63761] transition-colors">
                  Subscribe
                </button>
              </div>
            </div>
          </div>
          <div class="border-t border-gray-800 mt-12 pt-8 text-center text-gray-400">
            <p>&copy; 2024 HP FlowerPatch. All rights reserved.</p>
          </div>
        </div>
      </footer>
</template>

<script setup>
  const logoUrl = 'https://res.cloudinary.com/dcmwnrvzk/image/upload/v1732284199/flowers-logo_i4m7mv.png'


const footerLinks = [
  { href: '#about', text: 'About Us' },
  { href: '#services', text: 'Services' },
  { href: '#gallery', text: 'Gallery' },
  { href: '#faq', text: 'FAQ' },
  { href: '#terms', text: 'Terms & Conditions' },
  { href: '#privacy', text: 'Privacy Policy' }
]
</script>