<template>
  <section class="relative py-32 overflow-hidden bg-gradient-to-b from-white to-green-50/30">
    <!-- Background Decorative Elements -->
    <div class="absolute inset-0 bg-white/40 backdrop-blur-sm"></div>
    
    <div class="container mx-auto px-4 relative">
      <div class="grid md:grid-cols-2 gap-16 items-center">
        <!-- Video Column -->
        <div class="relative" 
             v-motion
             :initial="{ opacity: 0, x: -50 }"
             :enter="{ opacity: 1, x: 0, transition: { duration: 800 } }">
          <!-- Video Container with Loading State -->
          <div class="relative rounded-[2rem] overflow-hidden aspect-[4/5] bg-gray-100 shadow-2xl">
            <div v-if="!isVideoLoaded" 
                 class="absolute inset-0 flex items-center justify-center bg-gray-100 z-10">
              <div class="w-8 h-8 border-4 border-green-600 border-t-transparent rounded-full animate-spin"></div>
            </div>
            
            <video 
              ref="videoRef"
              class="w-full h-full object-cover transition-opacity duration-700"
              :class="{ 'opacity-0': !isVideoLoaded, 'opacity-100': isVideoLoaded }"
              :src="flowerVideo9"
              muted
              loop
              playsinline
              @loadeddata="handleVideoLoaded"
            />

            <!-- Decorative Overlay -->
            <div class="absolute inset-0 bg-gradient-to-t from-black/40 to-transparent opacity-60"></div>
          </div>

          <!-- Decorative Elements -->
          <div class="absolute -top-8 -left-8 w-48 h-48 bg-green-600/10 rounded-full blur-2xl"></div>
          <div class="absolute -bottom-8 -right-8 w-48 h-48 bg-green-600/10 rounded-full blur-2xl"></div>
        </div>

        <!-- Content Column -->
        <div v-motion
             :initial="{ opacity: 0, x: 50 }"
             :enter="{ opacity: 1, x: 0, transition: { duration: 800, delay: 200 } }"
             class="relative">
          <span class="text-green-600 font-medium mb-4 block">Your Garden Journey</span>
          <h2 class="text-4xl md:text-5xl font-bold mb-6 leading-tight">
            Growing Beauty,<br />Naturally
          </h2>
          <p class="text-lg text-gray-600 mb-8 leading-relaxed">
            At Garden Blooms, we cultivate plants that thrive in your garden. 
            Each plant is nurtured with care, selected for your local climate, 
            and comes with expert guidance to ensure it flourishes in your outdoor space. 
            Transform your garden into a sustainable haven of natural beauty.
          </p>

          <!-- Features Grid -->
          <div class="grid grid-cols-2 gap-6 mb-10">
            <div v-for="feature in features" 
                 :key="feature.title"
                 class="flex items-start space-x-3 group">
              <div class="mt-1 flex-shrink-0">
                <div class="w-8 h-8 rounded-full bg-green-600/10 flex items-center justify-center group-hover:bg-green-600 group-hover:scale-110 transition-all duration-300">
                  <component 
                    :is="feature.icon" 
                    class="w-4 h-4 text-green-600"
                  />
                </div>
              </div>
              <div>
                <h3 class="font-semibold mb-1">{{ feature.title }}</h3>
                <p class="text-sm text-gray-500">{{ feature.description }}</p>
              </div>
            </div>
          </div>

          <!-- CTA Button -->
          <NuxtLink 
            to="/garden-collection"
            class="inline-flex items-center space-x-2 bg-green-600 text-white px-8 py-3 rounded-full hover:bg-green-700 transition-all duration-300 transform hover:scale-105"
          >
            <span>Explore Plants</span>
            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3" />
            </svg>
          </NuxtLink>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
import { ref, onMounted, onUnmounted } from 'vue'
import { flowerVideo9 } from '@/store/videos'
import { 
  Sprout, 
  Sun, 
  Leaf,
  Calendar
} from 'lucide-vue-next'

const videoRef = ref<HTMLVideoElement | null>(null)
const isVideoLoaded = ref(false)
const playbackInterval = ref<ReturnType<typeof setInterval> | null>(null)

const features = [
  {
    title: 'Garden-Ready Plants',
    description: 'Healthy, mature plants ready for your garden',
    icon: Sprout
  },
  {
    title: 'Seasonal Varieties',
    description: 'Plants chosen for your growing zone',
    icon: Calendar
  },
  {
    title: 'Growing Support',
    description: 'Expert guidance for plant care success',
    icon: Leaf
  },
  {
    title: 'Climate Adapted',
    description: 'Species selected for local conditions',
    icon: Sun
  }
]

const handleVideoLoaded = async () => {
  isVideoLoaded.value = true
  if (videoRef.value) {
    try {
      await videoRef.value.play()
    } catch (error) {
      console.error('Video autoplay failed:', error)
    }
  }
}

const setupVideoPlayback = () => {
  playbackInterval.value = setInterval(() => {
    if (videoRef.value?.paused) {
      videoRef.value.play().catch(console.error)
    }
  }, 3000)
}

onMounted(() => {
  setupVideoPlayback()
})

onUnmounted(() => {
  if (playbackInterval.value) {
    clearInterval(playbackInterval.value)
  }
  if (videoRef.value && !videoRef.value.paused) {
    videoRef.value.pause()
  }
})
</script>