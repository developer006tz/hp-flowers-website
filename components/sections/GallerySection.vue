<template>
  <section id="gallery" class="py-20 bg-gradient-to-b from-pink-50 to-white">
    <div class="container mx-auto px-4">
      <h2 class="text-4xl font-cursive text-center text-fp-pink mb-16">Our Beautiful Arrangements</h2>
      <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
        <div v-for="(image, index) in galleryImages" 
             :key="index"
             v-motion-fade-visible-once
             class="relative group overflow-hidden rounded-xl">
          <img :src="image.url" 
               :alt="image.alt"
               class="w-full h-64 object-cover transform group-hover:scale-110 transition-transform duration-500" />
          <div class="absolute inset-0 bg-gradient-to-t from-black/50 to-transparent opacity-0 group-hover:opacity-100 transition-opacity">
            <div class="absolute bottom-4 left-4 text-white">
              <h4 class="text-lg font-semibold">{{ image.title }}</h4>
              <p class="text-sm">{{ image.price }}</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
const galleryImages = [
  {
    url: 'https://images.unsplash.com/photo-1594663653925-365bcbf7ef86',
    alt: 'Rose Bouquet',
    title: 'Classic Rose Bouquet',
    price: '$79.99'
  },
  {
    url: 'https://images.unsplash.com/photo-1561181286-d3fee7d55364',
    alt: 'Spring Mix',
    title: 'Spring Collection',
    price: '$89.99'
  },
  {
    url: 'https://images.unsplash.com/photo-1562690868-60bbe7293e94',
    alt: 'Wedding Bouquet',
    title: 'Wedding Special',
    price: '$149.99'
  },
  {
    url: 'https://images.unsplash.com/photo-1583228858294-6745cb25969e',
    alt: 'Seasonal Arrangement',
    title: 'Seasonal Blooms',
    price: '$99.99'
  }
]
</script>