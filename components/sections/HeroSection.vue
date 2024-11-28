<template>
  <section id="home"  class="pt-2 min-h-screen relative bg-gradient-to-b from-white to-pink-200">
        <div class="container mx-auto px-4 py-20 flex flex-col md:flex-row items-center">
          <div class="md:w-1/2 space-y-6">
            <h1 class="text-5xl md:text-6xl font-bold text-gray-800">
              Flowers, Everywhere Anywhere!
            </h1>
            <p class="text-xl text-gray-600">
              Delivering happiness with every bloom, right to your doorstep.
            </p>
            <div class="flex space-x-4">
              <button class="bg-hp-pink text-white px-8 py-3 rounded-full hover:bg-hp-pink-dark transition-all transform hover:scale-105">
                Shop Now
              </button>
              <button class="border-2 border-hp-pink text-hp-pink px-8 py-3 rounded-full hover:bg-hp-pink hover:text-white transition-all">
                Learn More
              </button>
            </div>
          </div>
          <div class="md:w-1/2 -mt-36 md:mt-0">
            <img src="https://res.cloudinary.com/dcmwnrvzk/image/upload/v1732288113/photo-1561181286-d3fee7d55364-removebg-preview_kxtqww.png" alt="Beautiful Flowers" class="rounded-lg shadow-none transform hover:scale-105 transition-transform" />
          </div>
        </div>

        <!-- Scroll Indicator -->
    <div class="absolute bottom-8 left-1/2 -translate-x-1/2 animate-bounce">
      <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 14l-7 7m0 0l-7-7m7 7V3" />
      </svg>
    </div>
      </section>
</template>


