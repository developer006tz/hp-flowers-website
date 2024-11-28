<template>
  <section class="py-20 bg-gray-50">
    <div class="container mx-auto px-4">
      <h2 class="section-title">What Our Customers Say</h2>
      <div class="grid md:grid-cols-3 gap-8">
        <div v-for="testimonial in testimonials" 
             :key="testimonial.name"
             v-motion-slide-visible-once-bottom
             class="bg-white p-8 rounded-xl shadow-lg">
          <div class="flex items-center mb-4">
            <img :src="testimonial.avatar" 
                 :alt="testimonial.name"
                 class="w-12 h-12 rounded-full object-cover" />
            <div class="ml-4">
              <h4 class="font-semibold">{{ testimonial.name }}</h4>
              <div class="flex text-yellow-400">
                <svg v-for="n in 5" :key="n" class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                  <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                </svg>
              </div>
            </div>
          </div>
          <p class="text-gray-600">{{ testimonial.text }}</p>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
const testimonials = [
  {
    name: 'Sarah Johnson',
    avatar: 'https://randomuser.me/api/portraits/women/1.jpg',
    text: 'The flowers were absolutely stunning! They arrived on time and stayed fresh for weeks.'
  },
  {
    name: 'Michael Chen',
    avatar: 'https://randomuser.me/api/portraits/men/2.jpg',
    text: 'Amazing service! The arrangement was even more beautiful than the pictures.'
  },
  {
    name: 'Emily Davis',
    avatar: 'https://randomuser.me/api/portraits/women/3.jpg',
    text: 'HP FlowerPatch made my wedding day perfect. The bouquets were exactly what I dreamed of!'
  }
]
</script>