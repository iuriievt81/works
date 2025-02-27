
const scene = new THREE.Scene();
const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
const renderer = new THREE.WebGLRenderer();
renderer.setSize(window.innerWidth, window.innerHeight);
document.getElementById('track-container').appendChild(renderer.domElement);


const ambientLight = new THREE.AmbientLight(0x404040, 0.5);
scene.add(ambientLight);

const spotlight = new THREE.SpotLight(0xffffff, 1, 100, Math.PI / 4, 0.5);
spotlight.position.set(30, 30, 30);
scene.add(spotlight);


const textureLoader = new THREE.TextureLoader();
const trackTexture = textureLoader.load('/src/sets/ai-generated-car-is-driving-on-an-empty-race-track-at-sunset-free-photo.jpg');
const trackMaterial = new THREE.MeshBasicMaterial({ map: trackTexture, side: THREE.DoubleSide });
const trackGeometry = new THREE.CylinderGeometry(20, 20, 1, 64); 
const track = new THREE.Mesh(trackGeometry, trackMaterial);
track.rotation.x = Math.PI / 2;
scene.add(track);


const barrierMaterial = new THREE.MeshBasicMaterial({ color: 0x00ff00 });
const barrierGeometry = new THREE.CylinderGeometry(0.5, 0.5, 2, 64);

const barrier1 = new THREE.Mesh(barrierGeometry, barrierMaterial);
barrier1.position.set(20, 0, 0);
const barrier2 = new THREE.Mesh(barrierGeometry, barrierMaterial);
barrier2.position.set(-20, 0, 0);
scene.add(barrier1, barrier2);


camera.position.set(0, 30, 50);
camera.lookAt(0, 0, 0);


let angle = 0;
function animate() {
    requestAnimationFrame(animate);

    
    track.rotation.y += 0.01;

    
    angle += 0.01;
    camera.position.x = 30 * Math.cos(angle);
    camera.position.z = 30 * Math.sin(angle);
    camera.lookAt(0, 0, 0);

    renderer.render(scene, camera);
}

animate();

let lapTime = 0;
let currentLap = 1; 
let speed = 50; 

function updateStats() {
    
    lapTime += 0.1; 
    if (lapTime >= 60) { 
        lapTime = 0; 
        currentLap += 1; 
    }

    
    document.getElementById('lap-time').textContent = `Lap Time: ${formatTime(lapTime)}`;
    document.getElementById('current-lap').textContent = `Current Lap: ${currentLap}`;
    document.getElementById('speed').textContent = `Speed: ${speed} km/h`;
}


function formatTime(timeInSeconds) {
    const minutes = Math.floor(timeInSeconds / 60);
    const seconds = Math.floor(timeInSeconds % 60);
    const milliseconds = Math.floor((timeInSeconds - Math.floor(timeInSeconds)) * 100);
    return `${String(minutes).padStart(2, '0')}:${String(seconds).padStart(2, '0')}:${String(milliseconds).padStart(2, '0')}`;
}


setInterval(updateStats, 100);


