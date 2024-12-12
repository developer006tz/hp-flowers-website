<template>
  <section class="py-24 bg-gradient-to-b from-white via-pink-50/20 to-white">
    <div class="container mx-auto px-4">
      <div class="text-center mb-16">
        <div class="w-20 h-1 bg-hp-pink mx-auto"></div>
        <h2 class="text-4xl md:text-5xl font-bold mt-8 mb-4">
          Best Sellers
        </h2>
      </div>

      <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4 md:gap-6">
        <div v-for="(category, index) in categories" 
             :key="category.id"
             v-motion
             :initial="{ opacity: 0, y: 100 }"
             :enter="{ opacity: 1, y: 0, transition: { delay: index * 200 } }"
             class="group relative">
          
          <div class="aspect-square rounded-2xl overflow-hidden bg-gray-100 relative shadow-lg hover:shadow-2xl transition-all duration-500">
            <!-- Loading Spinner -->
            <div v-if="!videoLoadedStates[index]" 
                 class="absolute inset-0 flex items-center justify-center bg-gray-100 z-10">
              <div class="w-8 h-8 border-4 border-hp-pink border-t-transparent rounded-full animate-spin"></div>
            </div>

            <video 
              :ref="(el) => handleVideoRef(el, index)"
              class="w-full h-full object-cover transition-opacity duration-500"
              :class="{ 'opacity-0': !videoLoadedStates[index], 'opacity-100': videoLoadedStates[index] }"
              :src="category.video"
              muted
              loop
              playsinline
              @loadeddata="handleVideoLoaded(index)"
            />

            <!-- Overlay with Order Button -->
            <div class="absolute inset-0 bg-black/40 opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex items-center justify-center">
              <NuxtLink 
                to="/contact"
                class="bg-white text-hp-pink hover:bg-hp-pink hover:text-white px-6 py-3 rounded-full transform -translate-y-4 group-hover:translate-y-0 opacity-0 group-hover:opacity-100 transition-all duration-500"
              >
                Order Now
              </NuxtLink>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'
import { flowerVideo1, flowerVideo2, flowerVideo3, flowerVideo4, flowerVideo5, flowerVideo6, flowerVideo7, flowerVideo8, flowerVideo9, flowerVideo10, flowerVideo11, flowerVideo12 } from '@/store/videos'

const videoRefs = ref([])
const videoLoadedStates = ref(new Array(12).fill(false))
const autoplayInterval = ref(null)

const categories = [
  { id: 1, video: flowerVideo1 },
  { id: 2, video: flowerVideo2 },
  { id: 3, video: flowerVideo3 },
  { id: 4, video: flowerVideo4 },
  { id: 5, video: flowerVideo5 },
  { id: 6, video: flowerVideo6 },
  { id: 7, video: flowerVideo7 },
  { id: 8, video: flowerVideo8 },
  { id: 9, video: flowerVideo9 },
  { id: 10, video: flowerVideo10 },
  { id: 11, video: flowerVideo11 },
  { id: 12, video: flowerVideo12 }
]

// Add the missing handleVideoRef function
const handleVideoRef = (el, index) => {
  if (el) {
    videoRefs.value[index] = el
  }
}

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
</script>