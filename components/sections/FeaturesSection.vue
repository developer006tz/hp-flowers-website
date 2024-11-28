<template>
  <section id="services" class="py-20 bg-white">
    <div class="container mx-auto px-4">
      <h2 class="text-4xl font-cursive text-center text-fp-green mb-16">Why Choose Flower Patch?</h2>
      <div class="grid md:grid-cols-3 gap-8">
        <div v-for="(feature, index) in features" 
             :key="index"
             v-motion-slide-visible-once-bottom
             class="text-center p-6 rounded-xl hover:shadow-xl transition-shadow">
          <div class="w-16 h-16 mx-auto mb-4 bg-pink-100 rounded-full flex items-center justify-center">
            <component :is="feature.icon" class="w-8 h-8 text-fp-pink" />
          </div>
          <h3 class="text-xl font-semibold text-fp-green mb-3">{{ feature.title }}</h3>
          <p class="text-gray-600">{{ feature.description }}</p>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
const features = [
  {
    title: 'Fresh Daily Flowers',
    description: 'Hand-picked fresh flowers delivered daily to ensure the highest quality.',
    icon: 'IconFlower'
  },
  {
    title: 'Same Day Delivery',
    description: 'Quick and reliable delivery service to your doorstep.',
    icon: 'IconTruck'
  },
  {
    title: 'Custom Arrangements',
    description: 'Personalized floral designs tailored to your preferences.',
    icon: 'IconHeart'
  }
]
</script>