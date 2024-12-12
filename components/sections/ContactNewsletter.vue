<!-- components/ContactSection.vue -->
<template>
  <section class="py-24 bg-gradient-to-br from-gray-50 to-gray-100">
    <div class="container mx-auto px-4 max-w-6xl">
      <div class="grid md:grid-cols-2 gap-12">
        <!-- Contact Form Card -->
        <div class="bg-white p-10 rounded-2xl shadow-xl animate-fade-in">
          <div class="flex items-center gap-3 mb-8">
            <Icon name="lucide:mail" class="text-hp-pink w-6 h-6" />
            <h3 class="font-display text-3xl">Contact Us</h3>
          </div>
          
          <form class="space-y-6" @submit.prevent="handleContactSubmit">
            <div class="space-y-1">
              <label class="block text-sm font-medium text-gray-700">Name</label>
              <input 
                v-model="contactForm.name"
                type="text"
                class="w-full px-4 py-3 rounded-xl border border-gray-200 
                focus:ring-2 focus:ring-hp-pink focus:border-transparent
                transition-all duration-200 hover:border-hp-pink"
              />
            </div>

            <div class="space-y-1">
              <label class="block text-sm font-medium text-gray-700">Email</label>
              <input 
                v-model="contactForm.email"
                type="email"
                class="w-full px-4 py-3 rounded-xl border border-gray-200 
                focus:ring-2 focus:ring-hp-pink focus:border-transparent
                transition-all duration-200 hover:border-hp-pink"
              />
            </div>

            <div class="space-y-1">
              <label class="block text-sm font-medium text-gray-700">Message</label>
              <textarea 
                v-model="contactForm.message"
                rows="4"
                class="w-full px-4 py-3 rounded-xl border border-gray-200 
                focus:ring-2 focus:ring-hp-pink focus:border-transparent
                transition-all duration-200 hover:border-hp-pink"
              />
            </div>

            <button 
              type="submit"
              class="w-full bg-hp-pink text-white px-6 py-4 rounded-xl
              hover:bg-hp-pink-dark transition-colors duration-200
              flex items-center justify-center gap-2 font-medium"
            >
              <Icon name="lucide:send" class="w-5 h-5" />
              Send Message
            </button>
          </form>
        </div>

        <!-- Newsletter Card -->
        <div class="bg-gradient-to-br from-hp-green to-hp-green/90 text-white p-10 rounded-2xl animate-slide-up">
          <div class="flex items-center gap-3 mb-8">
            <Icon name="lucide:bell" class="w-6 h-6" />
            <h3 class="font-display text-3xl">Newsletter</h3>
          </div>

          <p class="text-lg mb-8 text-white/90 leading-relaxed">
            Join our community and receive exclusive updates, insider news, and special offers. 
            Get 10% off your first order when you subscribe!
          </p>

          <form class="space-y-6" @submit.prevent="handleNewsletterSubmit">
            <div>
              <input 
                v-model="newsletterEmail"
                type="email" 
                placeholder="Enter your email address"
                class="w-full px-4 py-4 rounded-xl bg-white/10 text-white 
                placeholder-white/60 focus:ring-2 focus:ring-white focus:bg-white/20
                transition-all duration-200 border border-white/20"
              />
            </div>

            <button 
              type="submit"
              class="w-full bg-white text-hp-green px-6 py-4 rounded-xl
              hover:bg-hp-pink hover:text-white transition-colors duration-200
              flex items-center justify-center gap-2 font-medium group"
            >
              Subscribe Now
              <Icon 
                name="lucide:send" 
                class="w-5 h-5 transition-transform group-hover:translate-x-1" 
              />
            </button>
          </form>

          <div class="mt-12">
            <p class="font-medium text-lg mb-6">Connect With Us</p>
            <div class="flex space-x-6">
              <NuxtLink 
                v-for="social in socials" 
                :key="social.name"
                :to="social.url" 
                class="p-3 rounded-full bg-white/10 hover:bg-white/20 
                transition-colors duration-200 group"
              >
                <Icon 
                  :name="social.icon"
                  class="w-5 h-5 text-white/90 group-hover:text-white 
                  transition-colors duration-200"
                />
              </NuxtLink>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
const contactForm = ref({
  name: '',
  email: '',
  message: ''
})

const newsletterEmail = ref('')

const socials = [
  { name: 'Facebook', icon: 'lucide:facebook', url: '#' },
  { name: 'Instagram', icon: 'lucide:instagram', url: '#' },
  { name: 'Twitter', icon: 'lucide:twitter', url: '#' }
]

const handleContactSubmit = async () => {
  console.log('Contact form submitted:', contactForm.value)
}

const handleNewsletterSubmit = async () => {
  console.log('Newsletter subscription:', newsletterEmail.value)
}
</script>

<style scoped>
@keyframes fadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
}

@keyframes slideUp {
  from {
    transform: translateY(20px);
    opacity: 0;
  }
  to {
    transform: translateY(0);
    opacity: 1;
  }
}

.animate-fade-in {
  animation: fadeIn 0.5s ease-in-out;
}

.animate-slide-up {
  animation: slideUp 0.5s ease-out;
}
</style>