
class SlideStories {

    /** @param {string} id */
    constructor(id) {
        this.slide = document.querySelector(`[data-slide=${id}]`)
        this.active = 0
        this.init()
    }

    /** @param {Number} index */
    activeSlide(index) {
        this.active = index
        this.items.forEach((item) => item.classList.remove('active'))
        this.items[index].classList.add('active')
        this.thumbItems.forEach((item) => item.classList.remove('active'))
        this.thumbItems[index].classList.add('active')

		story_check(index);
		
		var itemId = this.items[index].id;
		var itemIdsubString = this.items[index].id.substring(0, 6);
		
		console.log(itemId);

        if (itemIdsubString != "videos") {
            this.autoSlide(2000)
            document.documentElement.style.setProperty("--slide-thumb-time", "2s");
        } else {
            this.autoSlide(6000)
            document.documentElement.style.setProperty("--slide-thumb-time", "6s");
            this.items[index].id.play();
        }
    }

    next() {
        if (this.active < this.items.length - 1) {
            this.activeSlide(this.active + 1)
        } else {
            this.activeSlide(0)
        }
    }

    prev() {
        if (this.active > 0) {
            this.activeSlide(this.active - 1)
        } else {
            this.activeSlide(this.items.length - 1)
        }
    }

    addNavigation() {
        const nextBtn = this.slide.querySelector('.slide-next')
        const prevBtn = this.slide.querySelector('.slide-prev')
        nextBtn.addEventListener('click', this.next)
        prevBtn.addEventListener('click', this.prev)
    }

    addThumbItems() {
        this.items.forEach(() => (this.thumb.innerHTML += `<span class="slide-thumb-item" style=""></span>`))
        this.thumbItems = Array.from(this.thumb.children)
    }

    autoSlide(s) {
        clearTimeout(this.timeout)
        this.timeout = setTimeout(this.next, s)
    }

    init() {
        
        this.next = this.next.bind(this)
        this.prev = this.prev.bind(this)
        this.items = this.slide.querySelectorAll('.slide-items > *')
        this.thumb = this.slide.querySelector('.slide-thumbs')
        this.addThumbItems()
        this.activeSlide(0)
        this.addNavigation()
    }
}

new SlideStories('slide')
