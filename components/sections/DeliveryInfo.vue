<template>
  <section class="py-20">
    <div class="container mx-auto px-4">
      <div class="bg-hp-green text-white rounded-2xl p-12">
        <div class="grid md:grid-cols-2 gap-12">
          <div>
            <h2 class="text-4xl font-display font-bold mb-6">Delivery Information</h2>
            <p class="text-xl mb-8">We make sure your flowers arrive fresh and beautiful, right when you need them.</p>
            <ul class="space-y-4">
              <li class="flex items-center space-x-3">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
                </svg>
                <span>Same Day Delivery for orders before 2 PM</span>
              </li>
              <li class="flex items-center space-x-3">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
                </svg>
                <span>Free delivery for orders above $50</span>
              </li>
              <li class="flex items-center space-x-3">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
                </svg>
                <span>Careful handling and temperature control</span>
              </li>
            </ul>
          </div>
          <div class="relative">
            <div class="absolute inset-0 bg-white/10 rounded-xl"></div>
            <div class="p-8">
              <h3 class="text-2xl font-semibold mb-4">Delivery Areas</h3>
              <p class="mb-4">We currently deliver to:</p>
              <ul class="grid grid-cols-2 gap-4">
                <li>Downtown</li>
                <li>North Side</li>
                <li>South Side</li>
                <li>West End</li>
                <li>East Side</li>
                <li>Suburbs</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>