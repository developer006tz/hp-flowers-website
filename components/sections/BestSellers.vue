<template>
  <section id="bestsellers" class="py-20">
    <div class="container mx-auto px-4">
      <h2 class="section-title">Best Sellers</h2>
      <p class="section-subtitle">Our most popular arrangements loved by customers</p>
      <div class="grid md:grid-cols-3 gap-8">
        <div v-for="product in products" :key="product.title" v-motion-slide-visible-once-bottom
          class="bg-white rounded-xl shadow-lg overflow-hidden hover:shadow-xl transition-shadow">
          <img :src="product.image" :alt="product.title" class="w-full h-64 object-cover" />
        </div>
      </div>
    </div>
  </section>

</template>

<script setup lang="ts">
const products = [{ 
  title: 'Enchanted Rose Bouquet',image: 'https://images.unsplash.com/photo-1594663653925-365bcbf7ef86' },
 { title: 'Spring Meadow Mix', image: 'https://images.unsplash.com/photo-1561181286-d3fee7d55364' },
  { title: 'Pure Elegance', image: 'https://images.unsplash.com/photo-1562690868-60bbe7293e94' }] 
</script>
