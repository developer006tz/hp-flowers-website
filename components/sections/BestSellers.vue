<!-- components/sections/BestSellers.vue -->
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
        <div v-for="(video, index) in videos" 
             :key="index"
             v-motion
             :initial="{ opacity: 0, y: 50 }"
             :enter="{ opacity: 1, y: 0, transition: { delay: index * 100 } }"
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
              :src="video"
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

<script setup lang="ts">
import { ref, onMounted, onUnmounted } from 'vue'
import { flowerStockVideos } from '@/store/videos'

interface VideoRefs {
  [key: number]: HTMLVideoElement | null;
}

// Using proper types for refs
const videoRefs = ref<VideoRefs>({})
const videoLoadedStates = ref<boolean[]>([])
const autoplayInterval = ref<ReturnType<typeof setInterval> | null>(null)

const videos = flowerStockVideos

// Initialize state array with the correct length
videoLoadedStates.value = new Array(videos.length).fill(false)

const handleVideoRef = (el: unknown, index: number) => {
  if (el instanceof HTMLVideoElement || el === null) {
    videoRefs.value[index] = el
  }
}

const handleVideoLoaded = async (index: number) => {
  videoLoadedStates.value[index] = true
  const videoRef = videoRefs.value[index]
  
  if (videoRef instanceof HTMLVideoElement) {
    try {
      await videoRef.play()
    } catch (error) {
      console.error(`Autoplay failed for video ${index}:`, error)
    }
  }
}

const setupVideoPlayback = () => {
  autoplayInterval.value = setInterval(() => {
    Object.entries(videoRefs.value).forEach(([index, videoRef]) => {
      if (videoRef instanceof HTMLVideoElement && 
          videoLoadedStates.value[Number(index)] && 
          videoRef.paused) {
        videoRef.play().catch(error => {
          console.error(`Playback check failed for video ${index}:`, error)
        })
      }
    })
  }, 3000)
}

onMounted(() => {
  setupVideoPlayback()
})

onUnmounted(() => {
  if (autoplayInterval.value) {
    clearInterval(autoplayInterval.value)
  }
  
  Object.values(videoRefs.value).forEach(videoRef => {
    if (videoRef instanceof HTMLVideoElement && !videoRef.paused) {
      videoRef.pause()
    }
  })
})
</script>