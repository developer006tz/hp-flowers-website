<template>
  <section id="about" class="py-20">
    <div class="container mx-auto px-4">
      <div class="grid md:grid-cols-2 gap-12 items-center">
        <div v-motion-slide-visible-once-left>
          <img src="https://images.unsplash.com/photo-1558024920-b41e1887dc32" 
               alt="About Us"
               class="rounded-2xl shadow-xl" />
        </div>
        <div v-motion-slide-visible-once-right>
          <h2 class="text-4xl font-display font-bold mb-6">Our Story</h2>
          <p class="text-xl text-gray-600 mb-6">
            At HP FlowerPatch, we believe in the power of flowers to bring joy and beauty to every moment. 
            Our passion for creating stunning arrangements drives us to source the freshest blooms and 
            deliver happiness to your doorstep.
          </p>
          <ul class="space-y-4 mb-8">
            <li class="flex items-center space-x-3">
              <svg class="w-6 h-6 text-hp-pink" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
              </svg>
              <span>Premium Quality Flowers</span>
            </li>
            <li class="flex items-center space-x-3">
              <svg class="w-6 h-6 text-hp-pink" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
              </svg>
              <span>Expert Florists</span>
            </li>
            <li class="flex items-center space-x-3">
              <svg class="w-6 h-6 text-hp-pink" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
              </svg>
              <span>Same Day Delivery</span>
            </li>
          </ul>
          <button class="bg-hp-green text-white px-8 py-3 rounded-full hover:bg-hp-pink transition-colors">
            Learn More
          </button>
        </div>
      </div>
    </div>
  </section>
</template>