<template>
  <section class="py-20 bg-gradient-to-b from-pink-50 to-white">
    <div class="container mx-auto px-4">
      <div class="bg-white rounded-2xl shadow-xl overflow-hidden">
        <div class="grid md:grid-cols-2">
          <div class="p-12 flex flex-col justify-center">
            <h2 class="text-4xl font-display font-bold mb-6">Spring Collection Sale!</h2>
            <p class="text-xl text-gray-600 mb-8">
              Get 20% off on all spring arrangements. Limited time offer!
            </p>
            <div class="space-y-4">
              <div class="flex items-center space-x-4">
                <div class="bg-pink-100 p-3 rounded-full">
                  <svg class="w-6 h-6 text-hp-pink" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                  </svg>
                </div>
                <div>
                  <p class="font-semibold">Offer ends in:</p>
                  <p class="text-hp-pink font-bold">3 days 12:45:30</p>
                </div>
              </div>
              <button class="bg-hp-pink text-white px-8 py-3 rounded-full hover:bg-hp-green transition-colors">
                Shop Now
              </button>
            </div>
          </div>
          <div class="relative h-96 md:h-auto">
            <img src="https://images.unsplash.com/photo-1561181286-d3fee7d55364" 
                 alt="Spring Collection"
                 class="absolute inset-0 w-full h-full object-cover" />
          </div>
        </div>
      </div>
    </div>
  </section>
</template>