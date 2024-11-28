<!-- components/sections/FeaturedCategories.vue -->
<template>
  <section id="categories" class="py-24 bg-gradient-to-b from-white to-pink-50/30">
    <div class="container mx-auto px-4">
      <!-- Section Header with Decorative Elements -->
      <div class="text-center mb-16 relative">
        <div class="absolute left-1/2 -translate-x-1/2 top-0 w-20 h-1 bg-hp-pink"></div>
        <h2 class="text-4xl md:text-5xl font-bold mt-8 mb-4">
          Explore Our Collections
        </h2>
        <p class="text-gray-600 text-lg max-w-2xl mx-auto">
          Discover our carefully curated selection of beautiful floral arrangements, 
          each designed to create unforgettable moments
        </p>
        <!-- Decorative Flowers -->
        <div class="absolute -top-4 left-4 md:left-20 transform -rotate-45 opacity-20">
          <svg width="40" height="40" viewBox="0 0 24 24" fill="#CC202A">
            <path d="M12,2L15.5,9L22,9L17,14L19,21L12,17L5,21L7,14L2,9L8.5,9L12,2Z" />
          </svg>
        </div>
        <div class="absolute -top-8 right-4 md:right-20 transform rotate-45 opacity-20">
          <svg width="60" height="60" viewBox="0 0 24 24" fill="#CC202A">
            <path d="M12,2L15.5,9L22,9L17,14L19,21L12,17L5,21L7,14L2,9L8.5,9L12,2Z" />
          </svg>
        </div>
      </div>

      <!-- Categories Grid -->
      <div class="grid md:grid-cols-2 lg:grid-cols-4 gap-8 px-2">
        <div v-for="(category, index) in categories" 
             :key="category.title"
             v-motion
             :initial="{ opacity: 0, y: 100 }"
             :enter="{ opacity: 1, y: 0, transition: { delay: index * 200 } }"
             class="group relative overflow-hidden rounded-2xl shadow-lg hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-2">
          
          <!-- Category Video with Overlay -->
          <div class="aspect-[4/5] overflow-hidden bg-gray-100 relative">
            <!-- Loading Spinner -->
            <div v-if="!videoLoadedStates[index]" 
                 class="absolute inset-0 flex items-center justify-center bg-gray-100/80 z-10">
              <div class="w-8 h-8 border-4 border-hp-pink border-t-transparent rounded-full animate-spin"></div>
            </div>

            <video 
              :ref="el => videoRefs[index] = el"
              class="w-full h-full object-cover transform group-hover:scale-110 transition-all duration-700"
              :class="{ 'opacity-0': !videoLoadedStates[index], 'opacity-100': videoLoadedStates[index] }"
              :src="category.video"
              muted
              loop
              playsinline
              @loadeddata="handleVideoLoaded(index)"
            />
            
            <!-- Gradient Overlay -->
            <div class="absolute inset-0 bg-gradient-to-t from-black/80 via-black/40 to-transparent opacity-80 group-hover:opacity-90 transition-opacity duration-500">
            </div>

            <!-- Content -->
            <div class="absolute inset-0 p-6 flex flex-col justify-end transform translate-y-4 group-hover:translate-y-0 transition-transform duration-500">
              <!-- Decorative Line -->
              <div class="w-12 h-1 bg-hp-pink mb-4 transform origin-left scale-x-0 group-hover:scale-x-100 transition-transform duration-500 delay-100"></div>
              
              <!-- Title -->
              <h3 class="text-2xl font-bold text-white mb-2 transform -translate-y-4 group-hover:translate-y-0 transition-transform duration-500 delay-200">
                {{ category.title }}
              </h3>
              
              <!-- Description -->
              <p class="text-white/90 mb-6 transform -translate-y-4 group-hover:translate-y-0 transition-transform duration-500 delay-300">
                {{ category.description }}
              </p>
              
              <!-- Button -->
              <button class="w-full md:w-auto bg-white text-hp-pink hover:bg-hp-pink hover:text-white px-6 py-3 rounded-full transition-all duration-300 transform opacity-0 group-hover:opacity-100 delay-400 flex items-center justify-center space-x-2">
                <span>Explore Collection</span>
                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3" />
                </svg>
              </button>
            </div>
          </div>

          <!-- Category Icon -->
          <div class="absolute top-4 right-4 bg-white/90 backdrop-blur-sm p-3 rounded-full transform rotate-12 group-hover:rotate-0 transition-all duration-500">
            <svg class="w-6 h-6 text-hp-pink" :class="categoryIcons[index]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" :d="categoryIcons[index].path" />
            </svg>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'
import { flowerVideo1, flowerVideo2, flowerVideo3, flowerVideo4 } from '@/store/videos'

const videoRefs = ref([])
const videoLoadedStates = ref(new Array(4).fill(false))
const autoplayInterval = ref(null)

const categories = [
  {
    title: 'Wedding Flowers',
    description: 'Make your special day truly magical with our elegant wedding collections',
    video: flowerVideo1
  },
  {
    title: 'Birthday Bouquets',
    description: 'Celebrate life\'s special moments with our stunning arrangements',
    video: flowerVideo2
  },
  {
    title: 'Anniversary Gifts',
    description: 'Express your eternal love with our romantic flower selections',
    video: flowerVideo3
  },
  {
    title: 'Custom Arrangements',
    description: 'Create your perfect bouquet with our bespoke design service',
    video: flowerVideo4
  }
]

const handleVideoLoaded = async (index) => {
  videoLoadedStates.value[index] = true
  try {
    await videoRefs.value[index].play()
  } catch (error) {
    console.log(`Autoplay failed for video ${index}:`, error)
  }
}

const setupVideoPlayback = () => {
  autoplayInterval.value = setInterval(() => {
    videoRefs.value.forEach((videoRef, index) => {
      if (videoRef && videoLoadedStates.value[index] && videoRef.paused) {
        videoRef.play().catch(error => {
          console.log(`Playback check failed for video ${index}:`, error)
        })
      }
    })
  }, 3000)
}

onMounted(() => {
  categories.forEach((_, index) => {
    if (videoRefs.value[index]) {
      videoRefs.value[index].load()
    }
  })
  setupVideoPlayback()
})

onUnmounted(() => {
  if (autoplayInterval.value) {
    clearInterval(autoplayInterval.value)
  }
  videoRefs.value.forEach(videoRef => {
    if (videoRef && !videoRef.paused) {
      videoRef.pause()
    }
  })
})

const categoryIcons = [
  { path: 'M21 12a9 9 0 01-9 9m9-9a9 9 0 00-9-9m9 9H3m9 9a9 9 0 01-9-9m9 9c1.657 0 3-4.03 3-9s-1.343-9-3-9m0 18c-1.657 0-3-4.03-3-9s1.343-9 3-9m-9 9a9 9 0 019-9' },
  { path: 'M12 8v13m0-13V6a2 2 0 112 2h-2zm0 0V5.5A2.5 2.5 0 109.5 8H12zm-7 4h14M5 12a2 2 0 110-4h14a2 2 0 110 4M5 12v7a2 2 0 002 2h10a2 2 0 002-2v-7' },
  { path: 'M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z' },
  { path: 'M11 4a2 2 0 114 0v1a1 1 0 001 1h3a1 1 0 011 1v3a1 1 0 01-1 1h-1a2 2 0 100 4h1a1 1 0 011 1v3a1 1 0 01-1 1h-3a1 1 0 01-1-1v-1a2 2 0 10-4 0v1a1 1 0 01-1 1H7a1 1 0 01-1-1v-3a1 1 0 00-1-1H4a2 2 0 110-4h1a1 1 0 001-1V7a1 1 0 011-1h3a1 1 0 001-1V4z' }
]
</script>