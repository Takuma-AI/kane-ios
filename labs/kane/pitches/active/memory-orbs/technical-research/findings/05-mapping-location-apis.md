# Mapping & Location APIs - Research Findings

## Executive Summary
Apple MapKit is FREE for iOS apps. Google Static Maps costs $2/1,000 images. Radar offers 90% cheaper geocoding than Google.

## Static Map Images for Transactions

### Pricing Comparison
| Service | Cost | Free Tier | Notes |
|---------|------|-----------|-------|
| **Apple MapKit** | FREE | Unlimited (iOS) | Native iOS only |
| **Google Static Maps** | $2/1,000 | New free tier 2025 | Up to 640x640px |
| **MapBox** | $50+/month | Limited | 85% more expensive |
| **Geoapify** | Freemium | Yes | Uses OpenStreetMap |
| **HERE Maps** | Free starter | 250 daily | No credit card |

### URLs
- Google: https://mapsplatform.google.com/pricing/
- MapBox: https://www.mapbox.com/pricing
- Geoapify: https://www.geoapify.com/static-maps-api/
- HERE: https://developer.here.com/

## Reverse Geocoding (Lat/Long → Address)

### Cost Comparison
| Service | Cost per 1,000 | Free Tier | Storage Rights |
|---------|----------------|-----------|----------------|
| **Google** | $5.00 | 40,000/month | 30-day cache only |
| **MapBox** | $0.45-0.75 | 100,000/month | Temporary use |
| **Radar** | $0.50 | Yes | Any use |

**Key Finding**: Radar is 90% cheaper than Google with more flexible terms.

## Apple MapKit (iOS Native)

### Capabilities (All FREE)
- MKMapSnapshotter for static images
- Reverse geocoding included
- Street-level panoramas
- Custom annotations
- No external API calls

### Requirements
- Apple Developer Program membership ($99/year)
- Native iOS development
- Under $10K monthly revenue (for MapKit JS)

## Weather API Integration

### OpenWeatherMap (Recommended)
- **Free**: 1,000,000 calls/month
- **Rate limit**: 60 calls/minute
- **Features**: 30+ weather parameters
- **URL**: https://openweathermap.org/price

### AccuWeather
- **Free**: 50 calls/day
- **Standard**: $25/month (225K calls)
- **Requirement**: Must display logo
- **URL**: https://developer.accuweather.com/packages

## Cost Scenarios

### 1,000 Users × 30 Transactions = 30,000 map images/month

| Platform | Map Images | Geocoding | Weather | **Total** |
|----------|------------|-----------|---------|-----------|
| iOS Native | $0 | $0 | $0 | **$0** |
| Web (Google) | $60 | $150 | $0 | **$210** |
| Web (Optimized) | $20 (Geoapify) | $15 (Radar) | $0 | **$35** |

### 10,000 Users × 50 Transactions = 500,000 images/month

| Platform | Map Images | Geocoding | Weather | **Total** |
|----------|------------|-----------|---------|-----------|
| iOS Native | $0 | $0 | $0 | **$0** |
| Web (Google) | $1,000 | $2,500 | $0 | **$3,500** |
| Web (Optimized) | $200 | $250 | $0 | **$450** |

## Implementation Strategy

### Phase 1: iOS First (FREE)
- Use native MapKit for everything
- No external API costs
- Best performance and privacy

### Phase 2: Web Support
- Start with Google (reliable, $2/1,000)
- Use Radar for geocoding (90% cheaper)
- Cache aggressively (respect terms)

### Phase 3: Scale Optimization
- Switch to Geoapify for maps (freemium)
- Consider self-hosting OpenStreetMap
- Batch process weather data

## Magical Experience Ideas

### Zero-Cost iOS Approach
- Live map snapshots for every transaction
- Weather overlay from OpenWeatherMap
- Walking distance from home/work
- All processing on-device

### Premium Web Experience
- Animated map transitions
- Street view integration
- Historical weather data
- Route visualization for travel

## Key Recommendations

1. **Start with iOS native** - It's free and unlimited
2. **For web, use hybrid approach** - Google for maps, Radar for geocoding
3. **Cache aggressively** - Respect terms but minimize API calls
4. **Weather is essentially free** - 1M calls/month covers most use cases